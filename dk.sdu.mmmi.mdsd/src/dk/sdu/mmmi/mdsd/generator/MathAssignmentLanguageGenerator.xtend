/*
 * generated by Xtext 2.12.0
 */
package dk.sdu.mmmi.mdsd.generator

import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.xtext.generator.AbstractGenerator
import org.eclipse.xtext.generator.IFileSystemAccess2
import org.eclipse.xtext.generator.IGeneratorContext
import javax.swing.JOptionPane
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.MathematicalExpression
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Addition
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Subtraction
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Multiplication
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Division
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Literal

/**
 * Generates code from your model files on save.
 * 
 * See https://www.eclipse.org/Xtext/documentation/303_runtime_concepts.html#code-generation
 */
class MathAssignmentLanguageGenerator extends AbstractGenerator {

	override void doGenerate(Resource resource, IFileSystemAccess2 fsa, IGeneratorContext context) {
		val math = resource.allContents.filter(MathematicalExpression).next
		val result = math.expression.compute
		System.out.println("Math expression = " + math.expression.display)
		// For +1 score, replace with hovering, see Bettini Chapter 8
		JOptionPane.showMessageDialog(null, "result = " + result, "Math Language", JOptionPane.INFORMATION_MESSAGE)
	}
	
	/**
	 * Start of recursive multi-dispatch methods for interpreting an arithmetic expression
	 */
	def dispatch int compute(Addition expression) {
		compute(expression.left) + compute(expression.right)
	}
	
	def dispatch int compute(Subtraction expression) {
		compute(expression.left) - compute(expression.right)
	}
	
	def dispatch int compute(Multiplication expression) {
		compute(expression.left) * compute(expression.right)
	}
	
	def dispatch int compute(Division expression) {
		compute(expression.left) / compute(expression.right)
	}
	
	def dispatch compute(Literal expression) {
		expression.value
	}
	
	/**
	 * Start of recursive multi-dispatch methods for displaying an arithmetic expression's complete syntax tree
	 */
	def dispatch CharSequence display(Addition expression)
		'''(�expression.left.display� + �expression.right.display�)'''
	
	def dispatch CharSequence display(Subtraction expression)
		'''(�expression.left.display� - �expression.right.display�)'''
	
	def dispatch CharSequence display(Multiplication expression)
		'''(�expression.left.display� * �expression.right.display�)'''
	
	def dispatch CharSequence display(Division expression)
		'''(�expression.left.display� / �expression.right.display�)'''
	
	def dispatch display(Literal expression)
		'''�expression.value�'''
	
}