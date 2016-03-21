package oracle.academy.service;

import oracle.academy.model.User;

import java.util.List;

/**
 * Created by Java on 21.03.2016.
 */
public interface UserService {
    User create(User user);
    User getById(Long id);
    boolean delete(User user);
    User update(User user);
    List<User> getAll();
}
