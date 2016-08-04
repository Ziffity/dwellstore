package customDroplet;

import java.io.IOException;


import javax.servlet.ServletException;

import atg.endeca.assembler.AssemblerTools;
import atg.endeca.assembler.NucleusAssemblerFactory;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

import com.endeca.infront.assembler.Assembler;
import com.endeca.infront.assembler.AssemblerException;
import com.endeca.infront.assembler.ContentItem;
import com.endeca.infront.cartridge.ContentSlotConfig;
import com.endeca.infront.serialization.JsonSerializer;

public class AutoSuggestDroplet extends DynamoServlet {
 
 private NucleusAssemblerFactory assemblerFactory;
 private AssemblerTools assemblerTools;

 public void service(DynamoHttpServletRequest req,
   DynamoHttpServletResponse res) throws ServletException, IOException {
  Assembler assembler;
  try {
   assembler = getAssemblerFactory().createAssembler();
   //Construct a content slot config to query content in the SearchBoxAutoSuggestContent collection
   String pContentCollection = req.getParameter("collection");
   if (pContentCollection != null) {
    // Creates a ContentSlotConfig with type "ContentSlot" and specified content collection and rule limit.
    ContentItem contentItem = new ContentSlotConfig(pContentCollection, 1);
    
    // Assemble the content
    ContentItem responseContentItem = assembler.assemble(contentItem);
  
  //  vlogDebug("reponse : "+responseContentItem);
    req.setParameter("contentItem", responseContentItem);
    // Send the assembled content response as JSON
    req.serviceLocalParameter("output", req, res);
    res.setHeader("content-type", "application/json");
    new JsonSerializer(res.getWriter()).write(responseContentItem);
   }
  } catch (AssemblerException e) {
   // TODO Auto-generated catch block
   if(isLoggingError()) {
    logError(e);
   }
  }

 }

 public NucleusAssemblerFactory getAssemblerFactory() {
  return assemblerFactory;
 }

 public void setAssemblerFactory(NucleusAssemblerFactory assemblerFactory) {
  this.assemblerFactory = assemblerFactory;
 }

 public AssemblerTools getAssemblerTools() {
  return assemblerTools;
 }

 public void setAssemblerTools(AssemblerTools assemblerTools) {
  this.assemblerTools = assemblerTools;
 }

}