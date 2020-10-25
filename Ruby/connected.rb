def connected?()
    return (!!`ping 192.168.1.1`) rescue false
end

puts connected?()
