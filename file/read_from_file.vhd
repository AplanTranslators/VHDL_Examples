library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;

entity file_read is
end entity file_read;

architecture behavioral of file_read is
begin
    process
        file input_file : text;
        variable file_line : line;
        variable value : integer;
        variable status : file_open_status;
    begin
        -- Open file for reading
        file_open(status, input_file, "input.txt", read_mode);
        assert status = open_ok
            report "Failed to open input.txt for reading"
            severity error;

        -- Read until end of file
        while not endfile(input_file) loop
            readline(input_file, file_line);
            read(file_line, value);
            report "Read value: " & integer'image(value) severity note;
        end loop;

        -- Close the file
        file_close(input_file);
        report "Read operation completed" severity note;
        wait;
    end process;
end architecture behavioral;