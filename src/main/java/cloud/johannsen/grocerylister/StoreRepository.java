package cloud.johannsen.grocerylister;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by cjohannsen on 6/15/16.
 */
@RepositoryRestResource(collectionResourceRel = "store", path = "store")
public interface StoreRepository extends PagingAndSortingRepository<Store, Long> {
}
