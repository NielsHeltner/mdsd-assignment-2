package dk.sdu.mmmi.mdsd.ui.hover

import org.eclipse.xtext.ui.editor.hover.html.DefaultEObjectHoverProvider
import com.google.inject.Inject
import dk.sdu.mmmi.mdsd.interpreter.MathAssignmentLanguageInterpreter
import org.eclipse.emf.ecore.EObject
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Expression
import org.eclipse.emf.ecore.util.Diagnostician

import static extension org.eclipse.emf.ecore.util.EcoreUtil.*
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableDeclaration

class MathAssignmentLanguageEObjectHoverProvider extends DefaultEObjectHoverProvider {

	@Inject
	extension MathAssignmentLanguageInterpreter

	override getHoverInfoAsHtml(EObject object) {
		var Expression expression
		if (object instanceof VariableDeclaration) {
			expression = object.expression
		}
		if (object instanceof Expression && object.programHasNoError) {
			expression = object as Expression
			println(object)
			return '''
				<p>
				result = <b>�expression.compute�</b>
				</p>
			'''
		}
		else {
			return super.getHoverInfoAsHtml(object)
		}
	}

	def programHasNoError(EObject object) {
		Diagnostician.INSTANCE.validate(object.rootContainer).children.empty
	}

}