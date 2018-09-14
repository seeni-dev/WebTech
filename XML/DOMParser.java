import java.io.File;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;

public class DOMParser{
	public static void print(String s){
		System.out.println(s);
	}
	public static void main(String[] args) throws Exception {
		File ifile=new File("jobs.xml");
		DocumentBuilderFactory dbFactory= DocumentBuilderFactory.newInstance();
		DocumentBuilder dbBuilder=dbFactory.newDocumentBuilder();
		Document doc=dbBuilder.parse(ifile);
		doc.getDocumentElement().normalize();
		print(doc.getDocumentElement().getNodeName());
		print("--------------");

		NodeList jobs=doc.getElementsByTagName("job");
		
		for(int i=0;i<jobs.getLength();i++){
			Node jobN=jobs.item(i);
			if(jobN.getNodeType()==Node.ELEMENT_NODE){
				Element jobE=(Element) jobN;
				StringBuilder sb=new StringBuilder();
				sb.append("ID:"+jobE.getAttribute("id"));
				//get Qualification
				String qual=jobE.getElementsByTagName("qualification").item(0).getTextContent();
				sb.append("\t QUAL:"+qual);		
				String noa=jobE.getElementsByTagName("noa").item(0).getTextContent();
				sb.append("\t NOA:"+noa);
				String location=jobE.getElementsByTagName("location").item(0).getTextContent();
				sb.append("\t LOCATION : "+location);
				print(sb.toString());
			}
		}		


	}
}