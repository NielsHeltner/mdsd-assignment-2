/*
 * generated by Xtext 2.12.0
 */
package dk.sdu.mmmi.mdsd.generator

import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Addition
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Division
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.EvaluateExpression
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.In
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Literal
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Multiplication
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Root
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Subtraction
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableDeclaration
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableReference
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class MathAssignmentLanguageGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		val root = resource.allContents.filter(Root).head
		root.elements.forEach[
			println(display)
		]
	}
	
	/**
	 * Start of recursive multi-dispatch methods for displaying an arithmetic expression's complete syntax tree
	 */
	def dispatch CharSequence display(EvaluateExpression element)
		'''Result is = �element.expression.display�'''
	
	def dispatch CharSequence display(Addition expression)
		'''(�expression.left.display� + �expression.right.display�)'''
	
	def dispatch CharSequence display(Subtraction expression)
		'''(�expression.left.display� - �expression.right.display�)'''
	
	def dispatch CharSequence display(Multiplication expression)
		'''(�expression.left.display� * �expression.right.display�)'''
	
	def dispatch CharSequence display(Division expression)
		'''(�expression.left.display� / �expression.right.display�)'''
	
	def dispatch CharSequence display(VariableDeclaration declaration)
		'''var �declaration.name� = �declaration.expression.display��IF declaration.in !== null��declaration.in.display��ENDIF�'''
	
	def dispatch CharSequence display(In in)
		''' in �in.expression.display�'''
	
	def dispatch CharSequence display(VariableReference reference)
		'''�reference.variable.expression.display�'''
	
	def dispatch display(Literal expression)
		'''�expression.value�'''
	
}