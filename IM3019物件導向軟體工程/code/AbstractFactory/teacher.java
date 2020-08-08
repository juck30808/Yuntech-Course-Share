//Abstract Factory Pattern Example: Parser


Class: ParserFactoryProducer

public final class ParserFactoryProducer {

	private ParserFactoryProducer(){
		throw new AssertionError();
	}
	public static AbstractParserFactory getFactory(String factoryType){
		
		switch(factoryType){
			case "NYFactory": return new NYParserFactory();
			case "TWFactory": return new TWParserFactory();
		}
		return null;
	}

}

Abstra: AbstractParserFactory

public interface AbstractParserFactory {
	public XMLParser getParserInstance(String parserType);
}


Class: NYParserFactory

public class NYParserFactory implements AbstractParserFactory {

	@Override
	public XMLParser getParserInstance(String parserType) {
		switch(parserType){
			case "NYERROR": return new NYErrorXMLParser();
			case "NYFEEDBACK": return new NYFeedbackXMLParser();
			case "NYORDER": return new NYOrderXMLParser();
			case "NYRESPONSE": return new NYResponseXMLParser();
		}
		return null;
	}

}
Class: TWParserFactory

public class TWParserFactory implements AbstractParserFactory {

	@Override
	public XMLParser getParserInstance(String parserType) {
		switch(parserType){
			case "TWERROR": return new TWErrorXMLParser();
			case "TWFEEDBACK": return new TWFeedbackXMLParser();
			case "TWORDER": return new TWOrderXMLParser();
			case "TWRESPONSE": return new TWResponseXMLParser();
		}
		return null;
	}

}

Class: Interface XMLParser

public interface XMLParser {
	
	public String parse();

}


Class: NYErrorXMLParser

public class NYErrorXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("NY Parsing error XML...");
		return "NY Error XML Message";
	}

}


Class: NYFeedbackXMLParser

public class NYFeedbackXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("NY Parsing feedback XML...");
		return "NY Feedback XML Message";
	}

}


Class: NYOrderXMLParser

public class NYOrderXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("NY Parsing order XML...");
		return "NY Order XML Message";
	}

}



Class: NYResponseParser

public class NYResponseXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("NY Parsing response XML...");
		return "NY Response XML Message";
	}

}


Class: TWErrorXMLParser

public class TWErrorXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("TW Parsing error XML...");
		return "TW Error XML Message";
	}

}


Class: TWFeedbackXMLParser

public class TWFeedbackXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("TW Parsing feedback XML...");
		return "TW Feedback XML Message";
	}

}

Class: TWOrderXMLParser

public class TWOrderXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("TW Parsing order XML...");
		return "TW Order XML Message";
	}

}


Class: TWResponseXMLParser

public class TWResponseXMLParser implements XMLParser{

	@Override
	public String parse() {
		System.out.println("TW Parsing response XML...");
		return "TW Response XML Message";
	}

}



Class: TestAbstractFactoryPattern

public class TestAbstractFactoryPattern {

	public static void main(String[] args) {
		
		AbstractParserFactory parserFactory = ParserFactoryProducer.getFactory("NYFactory");
		XMLParser parser = parserFactory.getParserInstance("NYORDER");
		String msg="";
		msg = parser.parse();
		System.out.println(msg);
		
		System.out.println("************************************");
		
		parserFactory = ParserFactoryProducer.getFactory("TWFactory");
		parser = parserFactory.getParserInstance("TWFEEDBACK");
		msg = parser.parse();
		System.out.println(msg);
	}

}


Result:

NY Parsing order XML...
NY Order XML Message
************************************
TW Parsing feedback XML...
TW Feedback XML Message

