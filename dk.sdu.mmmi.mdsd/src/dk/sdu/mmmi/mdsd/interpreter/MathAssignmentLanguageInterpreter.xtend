package dk.sdu.mmmi.mdsd.interpreter

import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Addition
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Subtraction
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Multiplication
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Division
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.Literal
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableReference
import dk.sdu.mmmi.mdsd.mathAssignmentLanguage.VariableDeclaration

class MathAssignmentLanguageInterpreter {
	
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
	
	def dispatch int compute(VariableDeclaration expression) {
		//compute(expression.expression)
		-1
	}
	
	def dispatch int compute(VariableReference expression) {
		compute(expression.variable)
	}
	
}