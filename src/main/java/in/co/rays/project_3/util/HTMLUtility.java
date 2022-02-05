package in.co.rays.project_3.util;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import in.co.rays.project_3.dto.DropdownList;
import in.co.rays.project_3.exception.ApplicationException;
import in.co.rays.project_3.model.ModelFactory;
import in.co.rays.project_3.model.RoleModelInt;

/**
 * HTML Utility class to produce HTML contents like Dropdown List.
 *
 * @author Shivam Tiwari
 *
 */
public class HTMLUtility {

    /**
     * Create HTML SELECT list from MAP paramters values
     *
     * @param name
     * @param selectedVal
     * @param map
     * @return
     */
    public static String getList(String name, String selectedVal,
            HashMap<String, String> map) {

        StringBuffer sb = new StringBuffer("<select class='form-control'  dropdown-item name='" + name + "' >");

        Set<String> keys = map.keySet();
        String val = null;
        boolean select=true;
        if(select){
        	sb.append("<option style='width:160px; heihgt:35px' selected value=''>-------"+name+"--------</option>");
        }

        for (String key : keys) {
            val = map.get(key);
            if (key.trim().equals(selectedVal)) {
                sb.append("<option selected value='" + key + "'>" + val
                        + "</option>");
            } else {
                sb.append("<option value='" + key + "'>" + val + "</option>");
            }
        }
        sb.append("</select>");
        return sb.toString();
    }

    /**
     * Create HTML SELECT List from List parameter
     *
     * @param name
     * @param selectedVal
     * @param list
     * @return
     */
    public static String getList(String name, String selectedVal, List list) {

        Collections.sort(list);

        List<DropdownList> dd = (List<DropdownList>) list;
        
       
       
       
        StringBuffer sb = new StringBuffer("<select dropdown-menu class='form-control' name='" + name + "'>");
		sb.append("<option style='width:160px; heihgt:35px' selected value=''>-------"+name+" --------</option>");
		
		String key = null;
        String val = null;

        for (DropdownList obj : dd) {
            key = obj.getKey();
            val = obj.getValue();

            if (key.trim().equals(selectedVal)) {
                sb.append("<option selected value='" + key + "'>" + val
                        + "</option>");
            } else {
                sb.append("<option value='" + key + "'>" + val + "</option>");
            }
        }
        sb.append("</select>");
        return sb.toString();
    }

}