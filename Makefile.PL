use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
              'LICENSE'=> 'perl',
              'NAME'    => 'Number::Format',
              'VERSION_FROM' => 'Format.pm', # finds $VERSION
             );
