import java.io.File;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.parsers.*;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;



class UserHandler extends DefaultHandler{
	boolean qualF,locF,idF,noaF;
	public static void print(String s){
		System.out.print(s);
	}
	@Override
	public void startElement(String uri,String localName, String qName,Attributes attr) throws SAXException{
		if(qName.equalsIgnoreCase("job")){
			//job
			String id=attr.getValue("id");
			idF=true;
			print("\nID:"+id);
		}
		if(qName.equalsIgnoreCase("qualification")){
			//qualification
			qualF=true;
		}
		if(qName.equalsIgnoreCase("noa")){
			//noa
			noaF=true;
		}
		if(qName.equalsIgnoreCase("location")){
			//location
			locF=true;
		}
	}
	@Override
	public void characters(char ch[], int start, int length) throws SAXException {
			if(qualF){
				print("\t QUAL:"+new String(ch,start,length));
				qualF=false;
			}
			if(noaF){
				print("\t NOA:"+new String(ch,start,length));
				noaF=false;
			}
			if(locF){
				print("\t LOCATION:"+new String(ch,start,length));
				locF=false;
			}
	}

}



public class SAXParserDemo{
	public static void print(String s){
		System.out.println(s);
	}
	public static void main(String[] args) throws Exception {
		File ifile=new File("jobs.xml");
		SAXParserFactory sxFactory=SAXParserFactory.newInstance();
		SAXParser sxparser=(SAXParser) sxFactory.newSAXParser();
		UserHandler uh=new UserHandler();
		sxparser.parse(ifile,uh);
	}
}