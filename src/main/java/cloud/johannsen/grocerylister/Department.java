package cloud.johannsen.grocerylister;

import javax.persistence.*;

/**
 * Created by cjohannsen on 5/23/16.
 */
@Entity
@Table(name="department")
public class Department {
    private Long id;
    private DepartmentName departmentName;

    public Department() {
        this.id = null;
        this.departmentName = null;
    }

    public Department(Long id, DepartmentName departmentName) {
        this.id = id;
        this.departmentName = departmentName;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Enumerated(EnumType.STRING)
    @Column(name="name")
    public DepartmentName getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(DepartmentName departmentName) {
        this.departmentName = departmentName;
    }
}