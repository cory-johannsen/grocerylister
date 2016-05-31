package cloud.johannsen.grocerylister;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

/**
 * Created by cjohannsen on 11/27/14.
 */
@RepositoryRestResource(collectionResourceRel = "groceryList", path = "grocerylist")
public interface GroceryListRepository extends PagingAndSortingRepository<GroceryList, Long> {

    List<Product> findByName(@Param("name") String name);

}
