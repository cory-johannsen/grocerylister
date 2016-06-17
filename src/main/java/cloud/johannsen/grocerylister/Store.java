package cloud.johannsen.grocerylister;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.SortedSet;

/**
 * Created by cjohannsen on 6/15/16.
 */
@Entity
@Table(name="store")
public class Store {
    private Long id;
    private String name;
    private List<Department> departments;
    private GroceryList groceryList;

    public Store() {
        id = null;
        name = null;
        departments = new ArrayList<>();
        groceryList = null;
    }

    public Store(Long id, String name, List<Department> departments, GroceryList groceryList) {
        this.id = id;
        this.name = name;
        this.departments = departments;
        this.groceryList = groceryList;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Column(name="name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="store_department",
            joinColumns=
            @JoinColumn(name="store_id", referencedColumnName="id"),
            inverseJoinColumns=
            @JoinColumn(name="department_id", referencedColumnName="id")
    )
    @OrderColumn(name="INDEX")
    public List<Department> getDepartments() {
        return departments;
    }

    public void setDepartments(List<Department> departments) {
        this.departments = departments;
    }

    @OneToOne
    @JoinColumn(name="grocery_list_id")
    public GroceryList getGroceryList() {
        return groceryList;
    }

    public void setGroceryList(GroceryList groceryList) {
        this.groceryList = groceryList;
    }
}
