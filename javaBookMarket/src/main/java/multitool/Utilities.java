/*
 *	Desenvolvido por Profº Cleber S. Oliveira 
 *	cleber@ifsp.edu.br / cleber,gulhos@gmail.com
 *	São Paulo, Brasil, 05 de Agosto de 2019  
 */


package multitool;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Utilities {
	
	public Utilities() {
	
	}
	
// Métodos de Limpeza de Dados
	
	public String  clearSqlInjection( String value ) {
		// Retirar or 1 = 1 do commando SQL
		String oneEqualOnePattern = "(\\(*\\)*)*((or)*(Or)*(OR)*(oR)*)*(\\(*\\)*)*(\"*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\\'*)(\\(*\\)*)*[0-9]+(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\\'*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\"*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*=(\\(*\\)*)*(\"*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\\'*)(\\(*\\)*)*[0-9]+(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\\'*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*(\"*)(\\(*\\)*)*(\\s*)(\\(*\\)*)*";
		String oneEqualOneReplace = "[Sql Injection Attempt]";
		// Retirar caracteres especiais do commando SQL
		String[] escapePattern = {"'", "\"", "--","\b", "\r", ";"};
		String[] replacePattern = {"`", "``", "[- -]","[bep]", "[enter]", "[semicolon]"};
		value = replaceAll(oneEqualOnePattern, oneEqualOneReplace, value);
		value = replaceAll(escapePattern, replacePattern, value);
		return value;	
	}

// Métodos de Checagem e Validação

	public boolean checkEmail( String email ) {
		String  patternEmail = "^[a-zA-Z0-9]+[.a-zA-Z0-9]*@[a-zA-Z0-9]+[.a-zA-Z0-9]*[.a-zA-Z0-9]*[.a-zA-Z0-9]*$";
	    Pattern padraoEmail= Pattern.compile(patternEmail, Pattern.CASE_INSENSITIVE);
	    Matcher matcher = padraoEmail.matcher(email);  
	    return( matcher.find() );    
	}


// Métodos de Gravação e Leitura de Arquivos
	
	
// Métodos Polimórficos (Replace) de Susbstituição utilizando Regex 

	public String replaceAll(String oneEqualOnePattern, String oneEqualOneReplace, String value) {
		return( value.replaceAll(oneEqualOnePattern, oneEqualOneReplace) );
	}

	public String replaceAll( String[] wantedPattern, String replacementPattern, String sourceText) {
		String outText = sourceText;
		for (int i = 0; i < wantedPattern.length; i++) {
			outText = outText.replaceAll(wantedPattern[i], replacementPattern);
		}
		return outText ;
	}	
	
	public String replaceAll( String[] wantedPattern, String[] replacementPattern, String sourceText) {
		String outText = sourceText;
		for (int i = 0; i < wantedPattern.length; i++) {
			outText = outText.replaceAll(wantedPattern[i], replacementPattern[i]);
		}
		return outText ;
	}

	
	public String[] replaceAll( String[] wantedPattern, String replacementPattern, String[] sourceText) {
		for (int i = 0; i < sourceText.length; i++) {
			for (int j = 0; j < wantedPattern.length; j++) {
				sourceText[j] = sourceText[j].replaceAll(wantedPattern[i], replacementPattern);
			} 
		}
		return sourceText ;
	}
	
	public String[] replaceAll( String[] wantedPattern, String[] replacementPattern, String[] sourceText) {
		for (int i = 0; i < sourceText.length; i++) {
			for (int j = 0; j < wantedPattern.length; j++) {
				sourceText[j] = sourceText[j].replaceAll(wantedPattern[i], replacementPattern[i]);
			} 
		}
		return sourceText ;
	}
	
}
