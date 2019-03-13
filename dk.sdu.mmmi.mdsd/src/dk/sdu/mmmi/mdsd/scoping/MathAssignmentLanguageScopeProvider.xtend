/*
 * generated by Xtext 2.16.0
 */
package dk.sdu.mmmi.mdsd.scoping

import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.MathAssignmentLanguagePackage
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableDeclaration
import java.util.List
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.EReference
import org.eclipse.xtext.scoping.Scopes

import static extension org.eclipse.xtext.EcoreUtil2.getAllContentsOfType

/**
 * This class contains custom scoping description.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#scoping
 * on how and when to use it.
 */
class MathAssignmentLanguageScopeProvider extends AbstractMathAssignmentLanguageScopeProvider {
	
	override getScope(EObject context, EReference reference) {
		if (reference == MathAssignmentLanguagePackage.eINSTANCE.variableReference_Variable) {
			val candidates = scopeCandidates(context)
			return Scopes.scopeFor(candidates)
		}
		super.getScope(context, reference)
	}
	
	/*
	 * Recursive method to find (bottom-up) candidates of type Variable Declaration
	 * for a Variable Reference (to allow local shadowing of declared variables).
	 * 
	 * The method checks if it has found a VariableDeclaration. If it has, it collects
	 * the contents of its container. If not, it recursively invokes itself.
	 */
	def private List<? extends EObject> scopeCandidates(EObject context) {
		val container = context.eContainer
		switch (context) {
			VariableDeclaration:
				container.getAllContentsOfType(VariableDeclaration)
			default:
				scopeCandidates(container)
		}
	}

}
