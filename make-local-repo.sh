#!/bin/bash

BINDIR=$(cd "$(dirname "$0")"; pwd)

LIBS=/Applications/EclipseOxygenModeling_iObserve/EclipseModelingTools.app/Contents/Eclipse/plugins

LIST=`cat << EOF
de.uka.ipd.sdq.dialogs
de.uka.ipd.sdq.dsexplore
de.uka.ipd.sdq.dsexplore.analysis.cost
de.uka.ipd.sdq.dsexplore.analysis.lqn
de.uka.ipd.sdq.dsexplore.analysis.reliability
de.uka.ipd.sdq.dsexplore.analysis.simucom
de.uka.ipd.sdq.dsexplore.bayesnets
de.uka.ipd.sdq.dsexplore.qml
de.uka.ipd.sdq.dsexplore.qml.handling
de.uka.ipd.sdq.simucomframework
de.uka.ipd.sdq.simulation
de.uka.ipd.sdq.units
de.uka.ipd.sdq.statistics
de.uka.ipd.sdq.pcm.stochasticexpressions
de.uka.ipd.sdq.featureconfig
de.uka.ipd.sdq.featuremodel
de.uka.ipd.sdq.errorhandling
de.uka.ipd.sdq.identifier
de.uka.ipd.sdq.identifier.edit
de.uka.ipd.sdq.pcm.cost
de.uka.ipd.sdq.pcm.designdecision
de.uka.ipd.sdq.pcm.stochasticexpressions
de.uka.ipd.sdq.probfunction
de.uka.ipd.sdq.probfunction.edit
de.uka.ipd.sdq.probfunction.math
de.uka.ipd.sdq.scheduler
de.uka.ipd.sdq.sensorframework
de.uka.ipd.sdq.sensorframework.storage
de.uka.ipd.sdq.simucomframework
de.uka.ipd.sdq.simucomframework.simucomstatus
de.uka.ipd.sdq.simucomframework.variables
de.uka.ipd.sdq.simulation
de.uka.ipd.sdq.simulation.abstractsimengine
de.uka.ipd.sdq.statistics
de.uka.ipd.sdq.stoex
de.uka.ipd.sdq.stoex.analyser
de.uka.ipd.sdq.stoex.edit
de.uka.ipd.sdq.tcfmoop
de.uka.ipd.sdq.units
de.uka.ipd.sdq.units.edit
de.uka.ipd.sdq.workflow
de.uka.ipd.sdq.workflow.launchconfig
de.uka.ipd.sdq.workflow.logging.console
de.uka.ipd.sdq.workflow.mdsd
de.uka.ipd.sdq.workflow.ui
de.uka.ipd.sdq.workflow.workbench
lpg.runtime.java
org.antlr.runtime
org.apache.commons.collections15
org.apache.commons.lang
org.apache.commons.logging
org.apache.commons.math
org.apache.log4j
org.opt4j
org.eclipse.draw2d
org.eclipse.e4.core.di.extensions.supplier
org.eclipse.emf
org.eclipse.emf.cdo
org.eclipse.emf.cdo.common
org.eclipse.emf.codegen
org.eclipse.emf.codegen.ecore
org.eclipse.emf.common.ui
org.eclipse.emf.databinding
org.eclipse.emf.ecore.edit
org.eclipse.emf.edit
org.eclipse.emf.edit.ui
org.eclipse.emf.mwe.utils
org.eclipse.emf.query
org.eclipse.emf.transaction
org.eclipse.emf.validation
org.eclipse.emf.workspace
org.eclipse.equinox.common
org.eclipse.gef
org.eclipse.gmf.runtime.common.core
org.eclipse.gmf.runtime.common.ui
org.eclipse.gmf.runtime.common.ui.action
org.eclipse.gmf.runtime.common.ui.services
org.eclipse.gmf.runtime.common.ui.services.action
org.eclipse.gmf.runtime.diagram.core
org.eclipse.gmf.runtime.diagram.ui
org.eclipse.gmf.runtime.draw2d.ui
org.eclipse.gmf.runtime.draw2d.ui.render
org.eclipse.gmf.runtime.emf.clipboard.core
org.eclipse.gmf.runtime.emf.commands.core
org.eclipse.gmf.runtime.emf.core
org.eclipse.gmf.runtime.emf.type.core
org.eclipse.gmf.runtime.emf.ui
org.eclipse.gmf.runtime.gef.ui
org.eclipse.gmf.runtime.notation
org.eclipse.jdt.compiler.apt
org.eclipse.jdt.compiler.tool
org.eclipse.jdt.core
org.eclipse.jdt.launching
org.eclipse.m2m.qvt.oml
org.eclipse.m2m.qvt.oml.common
org.eclipse.m2m.qvt.oml.cst.parser
org.eclipse.m2m.qvt.oml.ecore.imperativeocl
org.eclipse.m2m.qvt.oml.emf.util
org.eclipse.m2m.qvt.oml.ocl
org.eclipse.m2m.qvt.oml.project
org.eclipse.m2m.qvt.oml.runtime
org.eclipse.net4j
org.eclipse.net4j.util
org.eclipse.ocl
org.eclipse.ocl.common
org.eclipse.ocl.ecore
org.eclipse.sirius
org.eclipse.sirius.common
org.eclipse.sirius.common.ui
org.eclipse.sirius.ecore.extender
org.eclipse.sirius.ext.base
org.eclipse.sirius.ext.e3.ui
org.eclipse.sirius.ext.emf
org.eclipse.sirius.ext.emf.tx
org.eclipse.sirius.ext.emf.ui
org.eclipse.sirius.ext.jface
org.eclipse.sirius.ext.swt
org.eclipse.sirius.ui
org.eclipse.uml2.common
org.eclipse.uml2.common.edit
org.eclipse.uml2.types
org.eclipse.xpand
org.eclipse.xtend
org.eclipse.xtend.core
org.eclipse.xtend.lib
org.eclipse.xtend.lib.macro
org.eclipse.xtend.typesystem.emf
org.eclipse.xtend.standalone
org.eclipse.xtext
org.eclipse.xtext.ecore
org.eclipse.xtext.generator
org.eclipse.xtext.logging
org.eclipse.xtext.util
org.eclipse.xtext.xbase.lib
org.eclipse.xtext.xtext.generator
org.eclipse.lib
org.eclipse.lib.macro
org.hamcrest.core
org.jfree.jfreechart
org.jscience
org.junit
org.modelversioning.emfprofile
org.modelversioning.emfprofile.project
org.modelversioning.emfprofile.registry
org.palladiosimulator.analyzer.accuracy
org.palladiosimulator.analyzer.completions
org.palladiosimulator.analyzer.quality
org.palladiosimulator.analyzer.resultdecorator
org.palladiosimulator.analyzer.workflow
org.palladiosimulator.commons
org.palladiosimulator.editors.commons.dialogs
org.palladiosimulator.edp2
org.palladiosimulator.edp2.dao
org.palladiosimulator.edp2.util
org.palladiosimulator.mdsdprofiles.api
org.palladiosimulator.measurementframework
org.palladiosimulator.metricspec
org.palladiosimulator.pcm
org.palladiosimulator.pcm.cloud
org.palladiosimulator.pcm.edit
org.palladiosimulator.pcm.edp2.measuringpoint
org.palladiosimulator.pcm.privacy
org.palladiosimulator.pcm.resources
org.palladiosimulator.pcm.ui
org.palladiosimulator.probeframework
org.palladiosimulator.recorderframework
org.palladiosimulator.recorderframework.edp2
org.palladiosimulator.reliability
org.palladiosimulator.solver
org.palladiosimulator.solver.context
org.palladiosimulator.solver.lqn
org.palladiosimulator.solver.spa
org.palladiosimulator.solver.spa.basicsolver
org.palladiosimulator.solver.spa.resourcemodel
protocom.extension
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
