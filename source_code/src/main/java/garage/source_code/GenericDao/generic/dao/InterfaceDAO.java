/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package garage.source_code.GenericDao.generic.dao;

import java.util.List;

/**
 *
 * @author aro
 */
public interface InterfaceDAO {
    public void save(Object o) throws Throwable;
    public List<Object> findAll(Object o) throws Throwable;
    public List<Object> find(Object o) throws Throwable;
    public Object findById(Object o) throws Throwable;
    public void update(Object o) throws Throwable;
    public void delete(Object o) throws Throwable;
}
