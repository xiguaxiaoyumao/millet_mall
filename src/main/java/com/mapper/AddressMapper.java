package com.mapper;

import com.pojo.Address;

import java.util.List;

/**
 * @author zht
 * @date 2020/12/7 21:05
 */
public interface AddressMapper {
    public abstract List<Address> selectByActId(Address address);

    public abstract int updateAddressById(Address address);

    public abstract int insertAddress(Address address);

    public abstract Address selectByAddressId(Address address);
}
