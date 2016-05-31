package cloud.johannsen.grocerylister;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

/**
 * Created by cjohannsen on 5/24/16.
 */
@Controller
public class GroceryListerController {

    @Autowired
    GroceryListRepository groceryListRepository;

    @RequestMapping("/departments")
    public @ResponseBody List<Department> departments() {
        List<Department> departments = new ArrayList<>();
        for(Department department : Department.values()) {
            departments.add(department);
        }
        return departments;
    }

    @RequestMapping("/current_grocery_list")
    public @ResponseBody GroceryList currentGroceryList() {
        Iterable<GroceryList> groceryLists = groceryListRepository.findAll();
        GroceryList currentGroceryList = null;
        for(GroceryList groceryList : groceryLists) {
            if (currentGroceryList == null || currentGroceryList.getLastModified().before(groceryList.getLastModified())) {
                currentGroceryList = groceryList;
            }
        }
        return currentGroceryList;
    }
}
