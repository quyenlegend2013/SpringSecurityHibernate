/*
 * package demo.spring.security.service;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.security.core.userdetails.UserDetails; import
 * org.springframework.security.core.userdetails.UserDetailsService; import
 * org.springframework.security.core.userdetails.UsernameNotFoundException;
 * import org.springframework.stereotype.Service;
 * 
 * import demo.spring.security.DAO.UserDAO; import
 * demo.spring.security.model.Member;
 * 
 * @Service public class MyUserDetailsService implements UserDetailsService {
 * 
 * @Autowired private UserDAO userDAO;
 * 
 * public UserDetails loadUserByUsername(final String username) throws
 * UsernameNotFoundException {
 * 
 * Member user = userDAO.loadUserByUsername(username); if (user == null) {
 * return null; }
 * 
 * boolean enabled = true; boolean accountNonExpired = true; boolean
 * credentialsNonExpired = true; boolean accountNonLocked = true;
 * 
 * return new Member(username, user.getPassword(), enabled, accountNonExpired,
 * credentialsNonExpired, accountNonLocked, user.getAuthorities()); }
 * 
 * }
 */