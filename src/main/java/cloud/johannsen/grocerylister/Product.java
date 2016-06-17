package cloud.johannsen.grocerylister;

import javax.persistence.*;

/**
 * Created by cjohannsen on 5/23/16.
 */
@Entity
@Table(name="product")
public class Product {
    private Long id;
    private String name;
    private Department department;

    public Product() {
        this.id = null;
        this.name = null;
        this.department = null;
    }

    public Product(Long id, String name, Department department) {
        this.id = id;
        this.name = name;
        this.department = department;
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

    @OneToOne(fetch=FetchType.EAGER)
    @JoinColumn(name="department_id")
    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }
}
