package cloud.johannsen.grocerylister;

import javax.annotation.Nonnull;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by cjohannsen on 5/24/16.
 */
@Entity
@Table(name="grocery_list")
public class GroceryList {
    private Long id;
    private String name;
    private List<Product> products = new ArrayList<>();
    private Date lastModified = new Date();
    private Store store;

    public GroceryList() {
        id = null;
        name = null;
        store = null;
    }

    public GroceryList(Long id, String name, List<Product> products) {
        this.id = id;
        this.name = name;
        this.products = products;
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
    @Nonnull
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name="grocery_list_product",
            joinColumns=
                @JoinColumn(name="grocery_list_id", referencedColumnName="id"),
            inverseJoinColumns=
                @JoinColumn(name="product_id", referencedColumnName="id")
    )
    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @OneToOne(mappedBy = "groceryList")
    public Store getStore() {
        return store;
    }

    public void setStore(Store store) {
        this.store = store;
    }

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="last_modified")
    @Nonnull
    public Date getLastModified() {
        return lastModified;
    }

    public void setLastModified(Date lastModified) {
        this.lastModified = lastModified;
    }
}
