package oracle.academy.dao;

import oracle.academy.model.Role;
import oracle.academy.model.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Java on 15.03.2016.
 */
public class UserDaoImp implements UserDao {

    private Map<Long, User> userMap = new HashMap<>();
    private long id = 0;

    @Override
    public User create(User user) {
        user.setId(++id);
        userMap.put(user.getId(), user);
        return user;
    }

    @Override
    public User getById(Long id) {
        return userMap.get(id);
    }

    @Override
    public boolean delete(User user) {
        boolean isDeleted = false;
        if (userMap.containsKey(user.getId())) {
            userMap.remove(user.getId());
            isDeleted = true;
        }
        return isDeleted;
    }

    @Override
    public User update(User user) {
        return userMap.put(user.getId(), user);
    }

    @Override
    public List<User> getAll() {
        List<User> userList = new ArrayList<>();
        userList.addAll(userMap.values());
        return userList;
    }

}
