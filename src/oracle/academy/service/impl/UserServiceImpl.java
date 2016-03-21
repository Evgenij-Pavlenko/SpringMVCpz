package oracle.academy.service.impl;

import oracle.academy.dao.UserDao;
import oracle.academy.model.User;
import oracle.academy.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Java on 21.03.2016.
 */
    @Service
    @Transactional
    public class UserServiceImpl implements UserService {
        @Autowired
        private UserDao userDao;

        @Override
        public User create(User user) {
            return userDao.create(user);
        }

        @Override
        public User getById(Long id) {
            return userDao.getById(id);
        }

        @Override
        public boolean delete(User user) {
            return userDao.delete(user);
        }

        @Override
        public User update(User user) {
            return userDao.update(user);
        }



        @Override
        public List<User> getAll() {
            return userDao.getAll();
        }
}
