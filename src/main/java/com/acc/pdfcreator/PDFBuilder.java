package com.acc.pdfcreator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;



public class PDFBuilder extends AbstractITextPdfView {
	@Override
    protected void buildPdfDocument(Map<String, Object> model, Document doc,
            PdfWriter writer, HttpServletRequest request, HttpServletResponse response)
            throws Exception {
       
		Map<String, ArrayList> empIdAndData = (Map<String, ArrayList>)model.get("empIdAndData");
		String month = (String)model.get("month");
		
        doc.add(new Paragraph("Monthly Reports " + month));
         
        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100.0f);
        table.setWidths(new float[] {3.0f, 2.0f, 2.0f, 2.0f});
        table.setSpacingBefore(10);
         
        // define font for table header row
        Font font = FontFactory.getFont(FontFactory.HELVETICA);
        font.setColor(BaseColor.WHITE);
         
        // define table header cell
        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(BaseColor.BLUE);
        cell.setPadding(5);
         
        // write table header
        cell.setPhrase(new Phrase("EmployeeId", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Shift A", font));
        table.addCell(cell);
 
        cell.setPhrase(new Phrase("Shift B", font));
        table.addCell(cell);
         
        cell.setPhrase(new Phrase("Shift C", font));
        table.addCell(cell);
       
        for (Map.Entry<String, ArrayList> e : empIdAndData.entrySet()) {
        	 table.addCell(e.getKey());
        	ArrayList<Integer> esd = e.getValue();
        	for (Integer temp : esd) {
        		table.addCell(String.valueOf(temp));
    		}
        	if(esd.isEmpty())
        	{
        		table.addCell("Null");
        		table.addCell("Null");
        		table.addCell("Null");
        	}
     		
		    System.out.println(e.getKey());
		    System.out.println(e.getValue());
		}
   
         
        doc.add(table);

	}
}
