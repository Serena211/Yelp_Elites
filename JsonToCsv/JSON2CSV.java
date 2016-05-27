import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.csvreader.CsvWriter;

import org.json.CDL;
import org.apache.commons.io.FileUtils;

public class JSON2CSV
{

	public static void main(String[] args)
    {
    	readJsonFile();
    }
    
    public static void readJsonFile(){
    	BufferedReader br = null;
        JSONParser parser = new JSONParser();

        try {

            String sCurrentLine;

            br = new BufferedReader(new FileReader("C:\\Users\\ZHE\\Desktop\\json\\business.json"));
            //review_count,userID,fans,average_stars
            File file=new File("Yelp.csv");
            CsvWriter csvOutput = new CsvWriter(new FileWriter(file, true), ',');
            csvOutput.write("stars");
            csvOutput.write("review_count");
            csvOutput.write("Noise Level");
            csvOutput.write("Parking");
            csvOutput.write("Has TV");
            csvOutput.write("Price Range");
            csvOutput.endRecord();
            int i=0;
            while ((sCurrentLine = br.readLine()) != null) {
            	
                Object obj;
                try {
                    obj = parser.parse(sCurrentLine);
                    JSONObject jsonObject = (JSONObject) obj;

                    double stars =((Number)jsonObject.get("stars")).doubleValue();
                    double review =((Number)jsonObject.get("review_count")).doubleValue();
                    
                    System.out.println("\n");
 
                    csvOutput.write(Double.toString(stars));
                    csvOutput.write(Double.toString(review));
                    
                    JSONObject js=(JSONObject)jsonObject.get("attributes");
                    String noise;
                    if(js!=null){
                    	if(js.get("Noise Level")!=null){
                    		noise=(String) js.get("Noise Level");
                    		csvOutput.write(noise);
                    	}else csvOutput.write(null);

                    }else csvOutput.write(null);
                    
                    if(js!=null){
                    	if(js.get("Parking")!=null){
                    		JSONObject parking=(JSONObject)js.get("Parking");
                            Boolean lot;
                            Boolean validated;
                            Boolean street;
                            Boolean garage;
                            Boolean valet;
                            Boolean p=false;
                            	lot=(Boolean) parking.get("lot");
                            	validated=(Boolean) parking.get("validated");
                            	street=(Boolean) parking.get("street");
                            	garage=(Boolean) parking.get("garage");
                            	valet=(Boolean) parking.get("valet");
                            	while(true){
                            		if(lot!=null&&lot==true){
                            			p=true;
                            			break;
                            		}else if(validated!=null&&validated==true){
                            			p=true;
                            			break;
                            		}else if(street!=null&&street==true){
                            			p=true;
                            			break;
                            		}else if(garage!=null&&garage==true){
                            			p=true;
                            			break;
                            		}else if(valet!=null&&valet==true){
                            			p=true;
                            			break;
                            		}else break;
                            	}
                            	
                            	csvOutput.write(Boolean.toString(p));
                            	
                    	}else csvOutput.write(null);
                          
                    }else csvOutput.write(null);
                    
                    if(js!=null){
                    	if(js.get("Has TV")!=null){
                    		
                    		Boolean HasTV=(Boolean)js.get("Has TV");
                    		csvOutput.write(Boolean.toString(HasTV));
                    	}else{
                    		
                    		csvOutput.write(null);
                    	}
                    }else csvOutput.write(null);
                    
                    if(js!=null){
                    	if(js.get("Price Range")!=null){
                    		int fans =(int)(long)js.get("Price Range");
                    		csvOutput.write(Integer.toString(fans));
                    	}else csvOutput.write(null);
                    }else csvOutput.write(null);

                    csvOutput.endRecord();
                    
                } catch (ParseException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            csvOutput.flush();
            csvOutput.close();
            System.out.println("Finish!!!!!");
            
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (br != null)br.close();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
    }

}
