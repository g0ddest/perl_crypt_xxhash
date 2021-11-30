package main;

use utf8;
use warnings;
use strict;
use Module::Build;

my $build = Module::Build->new(
    module_name         => 'Crypt::xxHash',
    license             => 'bsd',
    create_readme       => 1,
    configure_requires  => {
        'Module::Build' => '0.19' # xs
    },
    build_requires       => {
        'ExtUtils::CBuilder' => 0.280225,
        'Test::More'         => 1.302183,
        'Math::Int64'        => '0.54' # 32bit perl without int64 :\
    },
    requires       => {
	},
    needs_compiler => 1,
    #extra_compiler_flags => ['-Wall -W -Wundef -Wno-implicit-function-declaration'],
    #extra_linker_flags => [ ],
    include_dirs   => ['.', 'src', 'ext/xxHash'], # ext/xxHash/tests/collisions/allcodecs
    c_source       => ['.', 'src'],
    xs_files       => {
        './xxHash.xs' => 'lib/Crypt/xxHash.xs' 
    },
    meta_merge     => {
        'resources' => {
            'bugtracker' => 'https://github.com/KalessinD/perl_crypt_xxhash/issues',
            'repository' => 'https://github.com/KalessinD/perl_crypt_xxhash',
        },
    }
);

$build->create_build_script;

1;
__END__
