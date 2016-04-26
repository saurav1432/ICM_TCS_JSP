/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author admin
 */
@WebListener()
public class NewServletListener implements HttpSessionListener {
     private static int count=0;
     public static int get_count()
     {
         return count;
     }

    @Override
   
    public void sessionCreated(HttpSessionEvent se) {
           count++;
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
     
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
