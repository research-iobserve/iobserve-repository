#!/bin/bash

BINDIR=$(cd "$(dirname "$0")"; pwd)

LIBS=~/.p2/pool/plugins

LIST=`cat << EOF
de.uka.ipd.sdq.identifier
org.palladiosimulator.pcm
org.palladiosimulator.pcm.cloud
org.palladiosimulator.pcm.privacy
de.uka.ipd.sdq.units
de.uka.ipd.sdq.stoex
de.uka.ipd.sdq.probfunction
de.uka.ipd.sdq.featuremodel
de.uka.ipd.sdq.dsexplore.qml
de.uka.ipd.sdq.pcm.cost
de.uka.ipd.sdq.pcm.designdecision
protocom.extension
org.eclipse.emf.cdo
org.eclipse.emf.cdo.common
org.eclipse.ocl
org.eclipse.ocl.common
org.eclipse.ocl.ecore
org.eclipse.net4j
org.eclipse.net4j.util
org.eclipse.equinox.common
lpg.runtime.java
EOF`

MVNDIR="${BINDIR}/mvn-repo"

if [ ! -d "${MVNDIR}" ] ; then
	mkdir "${MVNDIR}"
fi

export GRADLE_DEPENDENCIES="${BINDIR}/gradle.dependencies"

NEWLINE=$'\n'

rm -f "${GRADLE_DEPENDENCIES}"
touch "${GRADLE_DEPENDENCIES}"

for I in $LIST ; do
	echo "Op $I"
	for P in `find ${LIBS} -name "${I}_*.jar"` ; do
		echo "$P"
		if [ -f "$P" ] ; then
			N=`basename $P`
			ARTIFACT=`echo $N | sed 's/^\(.*\)_.*$/\1/'`
			VERSION=`echo $N | sed 's/^.*_\(.*\)\.jar$/\1/'`
			echo $N
		#	echo $ARTIFACT
		#	echo $VERSION
			mvn org.apache.maven.plugins:maven-install-plugin:2.3.1:install-file -Dfile="$P" \
				-DgroupId=extra -DartifactId=$ARTIFACT -Dpackaging=jar -Dversion=$VERSION \
				-DlocalRepositoryPath=mvn-repo
			echo "compile 'extra:${ARTIFACT}:${VERSION}'" >> "${GRADLE_DEPENDENCIES}"
		fi
	done
done

# end
