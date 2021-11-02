library ieee;
use ieee.std_logic_1164.all;

entity clock_divider is
    generic (
        CLOCK_IN_HZ : integer := 50000000;
        CLOCK_OUT_HZ: integer := 1
    );
    port (
        clk : in std_logic;
        rst : in std_logic;
        q : out std_logic
    );
end entity;

architecture logic of clock_divider is
  signal temp_q : std_logic := '0';
begin
    process (clk)
        variable num_cycles : integer := 0;
    begin
        if rising_edge(clk) then
            if rst = '1' then
                num_cycles := 0;
                temp_q <= '0';
            elsif rst = '0' then
                if (num_cycles = (CLOCK_IN_HZ/CLOCK_OUT_HZ-1)) then
                    num_cycles := 0;
                    temp_q <= not(temp_q);
                else
                    num_cycles := num_cycles + 1;
                end if;
            end if;
        end if;

    end process;

    -- update led_out 
    q <= temp_q;

end architecture;