

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.Iterator;

import com.sun.javafx.collections.MappingChange.Map;

/**
 * Servlet implementation class getRandomNumber
 */
@WebServlet("/getRandomNumber")
public class getRandomNumber extends HttpServlet 
{
	
	static int s=89;
	static HashMap<Integer,Integer> hm=new HashMap<Integer,Integer>();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getRandomNumber() 
    {
    	super();
  
		for (int i=1;i<91;i++)
		{
			hm.put(i, i);
		}
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		PrintWriter writer=response.getWriter();
		Random r=new Random();
		
		
		HttpSession session=request.getSession(false); 
		//System.out.println("HashMap");
		System.out.println(hm.toString());
		System.out.println("Size of HM : "+hm.size());
		int number=0;
		if(session==null)
		{
			//System.out.println("called");
			session=request.getSession(); 
			
		}
		else if(hm.size()==1)
		{
			hm.remove(90);
			session.invalidate();
			hm.clear();
		}
		else if(hm.size()==2)
		{
			number=hm.get(1);
			hm.remove(1);
		}
		else if(hm.size()>2)
		{
			int size=hm.size();
			int data=r.nextInt(size);
			System.out.println("data >> "+data);
			//System.out.println("Key : "+data+" Value : "+hm.get(data)+" >> hm Size = "+hm.size());
			if(data==0)
			{
				data=1;
			}
			number=hm.get(data);
			System.out.println("key : "+data+" value : "+number);
			for (int x=data;x<hm.size();x++) 
			{
				hm.put(x, hm.get(x+1));
				System.out.println("key : "+x+" >> "+hm.get(x+1));
			}
			hm.remove(hm.size()-1);
			
			
		}
		try 
		{
			Thread.sleep(5000);
		} 
		catch (InterruptedException e) 
		{
			e.printStackTrace();
		}
		writer.println(number);
	}

}
