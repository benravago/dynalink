#
set -x

rm -fr bin
mkdir -p bin

pushd src
find . -type f -not -name '*.java' -exec cp -v --parents {} ../bin ';'
popd

/opt/jdk15/bin/javac \
  -d bin -sourcepath src \
  $(find src -name '*.java')

rm -f dynalink-14.jar

/opt/jdk15/bin/jar \
  -c -f dynalink-14.jar \
  -C bin .

