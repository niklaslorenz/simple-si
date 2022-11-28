
library IEEE;
use IEEE.std_logic_1164.all;

entity simple_si is
port(
    data1 : in std_logic_vector(31 downto 0);
    data2 : in std_logic_vector(31 downto 0);
    control : in std_logic_vector(3 downto 0);
    result1 : out std_logic_vector(31 downto 0);
    result2 : out std_logic_vector(31 downto 0);
);
end entity simple_si;

architecture arch is
    signal data : std_logic_vector(63 downto 0);
    signal result : std_logic_vector(63 downto 0);
begin
    
    data <= data2 & data1;
    
    with control select result <=
        (others >= '0')                         when x"0",
        data(58 downto 0) & data(63 downto 59)  when x"1",
        data(63 downto 32) xor data(31 downto 0)when x"2",
        data(63 downto 32) and data(31 downto 0) when others;
    
    result1 <= result(31 downto 0);
    result2 <= result(63 downto 32);
    
end architecture;

