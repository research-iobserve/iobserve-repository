#!/bin/bash

BINDIR=$(cd "$(dirname "$0")"; pwd)

LIBS=~/.p2/pool/plugins

LIST=`cat << EOF
de.uka.ipd.sdq.identifier
org.palladiosimulator.pcm
org.palladiosimulator.pcm.resources
org.palladiosimulator.solver
org.palladiosimulator.solver.context
org.palladiosimulator.analyzer.workflow
org.palladiosimulator.analyzer.completions
org.palladiosimulator.analyzer.quality
org.palladiosimulator.analyzer.resultdecorator
de.uka.ipd.sdq.workflow.mdsd
de.uka.ipd.sdq.workflow.launchconfig
de.uka.ipd.sdq.workflow.logging.console
de.uka.ipd.sdq.workflow.ui
de.uka.ipd.sdq.workflow
de.uka.ipd.sdq.units
de.uka.ipd.sdq.statistics
de.uka.ipd.sdq.pcm.stochasticexpressions
de.uka.ipd.sdq.featuremodel
de.uka.ipd.sdq.errorhandling
de.uka.ipd.sdq.tcfmoop
de.uka.ipd.sdq.stoex
de.uka.ipd.sdq.stoex.analyse
de.uka.ipd.sdq.probfunction
de.uka.ipd.sdq.probfunction.math
de.uka.ipd.sdq.dsexplore
de.uka.ipd.sdq.dsexplore.analysis.simucom
de.uka.ipd.sdq.dsexplore.analysis.reliability
de.uka.ipd.sdq.pcm.designdecision
de.uka.ipd.sdq.pcm.cost
de.uka.ipd.sdq.dsexplore.qml
de.uka.ipd.sdq.pcm.taskmodel
de.uka.ipd.sdq.simucomframework
de.uka.ipd.sdq.simucomframework.variables
org.opt4j
protocom.extension
org.eclipse.emf.cdo
org.eclipse.emf.cdo.common
org.eclipse.ocl
org.eclipse.ocl.common
org.eclipse.ocl.ecore
org.eclipse.net4j
org.eclipse.net4j.util
org.eclipse.equinox.common
org.eclipse.xpand
org.eclipse.xtend.core
org.eclipse.xtend.typesystem.emf
org.eclipse.xtend.standalone
org.eclipse.xtend
org.eclipse.lib
org.eclipse.lib.macro

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
        S=`find ${LIBS} -name "${I}.source_*.jar" | head -1`
		if [ -f "$P" ] ; then
			N=`basename $P`
			ARTIFACT=`echo $N | sed 's/^\(.*\)_.*$/\1/'`
			VERSION=`echo $N | sed 's/^.*_\(.*\)\.jar$/\1/'`
			echo $N
		#	echo $ARTIFACT
		#	echo $VERSION
			mvn org.apache.maven.plugins:maven-install-plugin:2.5.2:install-file -Dfile="$P" \
				-DgroupId=extra -DartifactId=$ARTIFACT -Dpackaging=jar -Dversion=$VERSION \
				-DlocalRepositoryPath=mvn-repo -Dsources="$S"
			echo "compile 'extra:${ARTIFACT}:${VERSION}'" >> "${GRADLE_DEPENDENCIES}"
		fi
	done
done

# end
