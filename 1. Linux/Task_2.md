# Linux

## Task 2

1. **Analyze the structure of the /etc/passwd and /etc/group file, what fields are present in it, what users exist on the system? Specify several pseudo-users, how to define them?**

    ```
    student@CsnKhai:~$ cat /etc/passwd
    root:x:0:0:Root The Great,777,380987654321,12-34-56,Root user. That's it.:/root:/bin/bash
    daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
    bin:x:2:2:bin:/bin:/usr/sbin/nologin
    sys:x:3:3:sys:/dev:/usr/sbin/nologin
    sync:x:4:65534:sync:/bin:/bin/sync
    games:x:5:60:games:/usr/games:/usr/sbin/nologin
    man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
    lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
    mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
    news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
    uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
    proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
    www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
    list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
    irc:x:39:39:ircd:/var/run/ircd:/usr/sbin/nologin
    gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/usr/sbin/nologin
    nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
    libuuid:x:100:101::/var/lib/libuuid:
    syslog:x:101:104::/home/syslog:/bin/false
    messagebus:x:102:105::/var/run/dbus:/bin/false
    sshd:x:103:65534::/var/run/sshd:/usr/sbin/nologin
    student:x:1000:1000:Student KhAI,,,:/home/student:/bin/bash
    ```

    As we can see, `etc/passwd` contains information about user accounts. More detailed information about the fields is shown below.

    ![](images/passwd_info.png)

    Our system contains two users: `root` (but root might also be considered a pseudo-user) and `student`, as indicated by the `/bin/bash` value in a shell field.

    The rest of the users, like `daemon`, `bin` and others, are pseudo-users (system accounts that are used for specific purposes).

    `etc/group` file is provided below:

    ```
    student@CsnKhai:~$ cat /etc/group
    root:x:0:
    daemon:x:1:
    bin:x:2:
    sys:x:3:
    adm:x:4:syslog,student
    tty:x:5:
    disk:x:6:
    lp:x:7:
    mail:x:8:
    news:x:9:
    uucp:x:10:
    man:x:12:
    proxy:x:13:
    kmem:x:15:
    dialout:x:20:
    fax:x:21:
    voice:x:22:
    cdrom:x:24:student
    floppy:x:25:
    tape:x:26:
    sudo:x:27:student
    audio:x:29:
    dip:x:30:student
    www-data:x:33:
    backup:x:34:
    operator:x:37:
    list:x:38:
    irc:x:39:
    src:x:40:
    gnats:x:41:
    shadow:x:42:
    utmp:x:43:
    video:x:44:
    sasl:x:45:
    plugdev:x:46:student
    staff:x:50:
    games:x:60:
    users:x:100:
    nogroup:x:65534:
    libuuid:x:101:
    netdev:x:102:
    crontab:x:103:
    syslog:x:104:
    messagebus:x:105:
    fuse:x:106:
    mlocate:x:107:
    ssh:x:108:
    student:x:1000:
    lpadmin:x:109:student
    sambashare:x:110:student
    ```

    This file contains information about user groups. Each line represents a group and consists of several fields:

    - Group Name: The name of the group.
    - Password: Similar to the `/etc/passwd` file, but not used.
    - Group ID (GID): A unique numeric identifier for the group.
    - Group List: A comma-separated list of secondary group IDs.
    
    <br>

2. **What are the uid ranges? What is UID? How to define it?**

    UID stands for User Identifier, which is a unique numeric value assigned to each user on a Unix-like system. UID ranges are used to categorize user accounts:

    - Root: Value of 0;
    - System Accounts: These typically have low UIDs (e.g., 1-999) and are used for system processes.
    - User Accounts: These have UIDs in the higher range (e.g., 1000 and above) for regular users.
    
    <br>
    
    In order to define UID we can use command `id` or check `passwd` file

    ```
    student@CsnKhai:~$ id

    uid=1000(student) gid=1000(student) groups=1000(student),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),109(lpadmin),110(sambashare)
    ```

3. **What is GID? How to define it?**

    GID stands for Group Identifier, which is a unique numeric value assigned to each group on a Unix-like system. Groups help manage access and permissions for multiple users.

4. **How to determine belonging of user to the specific group?**

    To determine if a user belongs to a specific group, we can use the groups command followed by the username. For example:

    ```bash
    student@CsnKhai:~$ groups student
    
    student : student adm cdrom sudo dip plugdev lpadmin sambashare
    ```

5. **What are the commands for adding a user to the system? What are the basic parameters required to create a user?**

    To add a new user, the `adduser` command could be used. It requires a username and password. 

    ```
    student@CsnKhai:~$ sudo adduser temporaryuser
    [sudo] password for student: 
    Adding user `temporaryuser' ...
    Adding new group `temporaryuser' (1001) ...
    Adding new user `temporaryuser' (1001) with group `temporaryuser' ...
    Creating home directory `/home/temporaryuser' ...
    Copying files from `/etc/skel' ...
    Enter new UNIX password: 
    Retype new UNIX password: 
    passwd: password updated successfully
    Changing the user information for temporaryuser
    Enter the new value, or press ENTER for the default
            Full Name []: Temp User
            Room Number []: 
            Work Phone []: 
            Home Phone []: 
            Other []: 
    Is the information correct? [Y/n] Y
    ```

6. **How do I change the name (account name) of an existing user?**

    To change the name (account name) of an existing user, we can use the `usermod` command with the `-l` option:

    ```bash
    student@CsnKhai:~$ sudo usermod -l temp_user temporaryuser

    student@CsnKhai:~$ cat /etc/passwd | grep temp_user

    temp_user:x:1001:1001:Temp User,,,:/home/temporaryuser:/bin/bash
    ```

7. **What is skell_dir? What is its structure?**

    `skel_dir` is the skeleton directory that contains files and configurations used as templates for creating new user home directories. The structure may include default settings for the user environment.

8. **How to remove a user from the system (including his mailbox)?**

    To remove a user from the system, including their mailbox, we can use the `userdel` command with the `-r` option:

    ```bash
    student@CsnKhai:~$ sudo userdel -r temp_user
    userdel: temp_user mail spool (/var/mail/temp_user) not found
    ```

9. **What commands and keys should be used to lock and unlock a user account?**

    To lock and unlock user accounts, the `passwd` command should be used with keys `-l` and `-u`:

    ```bash
    student@CsnKhai:~$ sudo passwd -l new_user 
    passwd: password expiry information changed.
    student@CsnKhai:~$ sudo passwd -u new_user 
    passwd: password expiry information changed.
    ```

10. **How to remove a user's password and provide him with a password-free login for subsequent password change?**

    To remove a user's password and allow password-free login for subsequent password change, we can use the `passwd` command with the `-d` option:

    ```bash
    student@CsnKhai:~$ sudo passwd -d new_user
    passwd: password expiry information changed.
    ```

11. **Display the extended format of information about the directory, tell about the information columns displayed on the terminal.**

    `ls -la` allows to display extended format of information about the directory:

    ```bash
    student@CsnKhai:~$ ls -la
    total 36
    drwxr-xr-x 3 student student 4096 Aug 15 00:35 .
    drwxr-xr-x 4 root    root    4096 Aug 15 20:48 ..
    -rw------- 1 student student 3349 Aug 15 18:36 .bash_history
    -rw-r--r-- 1 student student  220 Sep 15  2015 .bash_logout
    -rw-r--r-- 1 student student 3637 Sep 15  2015 .bashrc
    drwx------ 2 student student 4096 Sep 15  2015 .cache
    -rw-rw-r-- 1 student student  395 Aug 15 00:14 myfile.txt
    -rw-r--r-- 1 root    root      49 Aug 14 21:47 .plan
    -rw-r--r-- 1 student student  675 Sep 15  2015 .profile
    ```

    Output includes:
    - is entry a file, directory, or other type
    - access rights (read, write, execute for the owner, group, and others)
    - number of links
    - username
    - group
    - size in bytes
    - last modification date
    - name

    <br>

12. **What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.**

    `rwx` is an acronym for `read`, `write`, `execute`.

    - Read (r): Allows viewing and reading a file.
    - Write (w): Allows modifying and deleting a file.
    - Execute (x): Allows executing a file (for directories, allows traversal).
    
    These rights apply to three roles: owner, group, and others (everyone else).

13. **What is the sequence of defining the relationship between the file and the user?**

    If the file's UID matches the process UID, then the user is the owner of the file. If a file's GID matches the GID of any group, the user is a member of the group to which the file belongs. If neither the UID nor the GID of the file intersect with the UID of the process or a list of groups that started the user, this user is an outsider.

14. **What commands are used to change the owner of a file (directory), as well as the mode of access to the file? Give examples, demonstrate on the terminal.**

    In order to change file owner `chown` command is used.

    ```bash
    student@CsnKhai:~$ ls -la | grep myfile.txt

    -rw-rw-r-- 1 student student  395 Aug 15 00:14 myfile.txt

    student@CsnKhai:~$ sudo chown new_user myfile.txt 

    student@CsnKhai:~$ ls -la | grep myfile.txt

    -rw-rw-r-- 1 new_user student  395 Aug 15 00:14 myfile.txt
    ```

    To change permissions `chmod` command exists.

    ```bash
    student@CsnKhai:~$ ls -la | grep myfile.txt

    -rw-rw-r-- 1 new_user student  395 Aug 15 00:14 myfile.txt

    student@CsnKhai:~$ sudo chmod 777 myfile.txt 

    student@CsnKhai:~$ ls -la | grep myfile.txt

    -rwxrwxrwx 1 new_user student  395 Aug 15 00:14 myfile.txt
    ```

15. **What is an example of octal representation of access rights? Describe the umask command.**

    An octal representation of access rights is a three-digit number that represents the permissions for a file or directory in the form of read (r), write (w), and execute (x) permissions for the owner, group, and others.

    For example, `chmod 644 myfile.txt` sets the following permissions:

    - Owner: read and write (`6`)
    - Group: read (`4`)
    - Others: read (`4`)

    <br>
    A more detailed example is provided in the picture below.<br><br>

    ![](images/rwx_octal.png)

    The `umask` command is used to set the default permissions for newly created files and directories. It subtracts the specified mask from the default maximum permissions to determine the actual permissions.

    ```bash
    student@CsnKhai:~$ umask
    0002

    student@CsnKhai:~$ touch temp
    student@CsnKhai:~$ ls -la | grep temp
    -rw-rw-r-- 1 student  student    0 Aug 15 21:49 temp

    student@CsnKhai:~$ umask 777
    student@CsnKhai:~$ touch temp2
    student@CsnKhai:~$ ls -la | grep temp2
    ---------- 1 student  student    0 Aug 15 21:51 temp2
    ```

16. **Give definitions of sticky bits and mechanism of identifier substitution. Give an example of files and directories with these attributes.**

    Sticky Bit: The sticky bit is a permission that can be applied to directories. When the sticky bit is set on a directory, only the owner of a file can delete or rename the file within that directory, even if other users have write permissions on the directory.

    Mechanism of Identifier Substitution: In Unix-like systems, user and group identifiers can be associated with files and directories. When a user or group with appropriate permissions tries to access a file or directory, the system checks the identifiers to determine if access should be granted.

    Sticky Bit usage example:
    ```bash
    student@CsnKhai:~$ ls -la | grep temp_dir
    drwxrwxr-x 2 student  student 4096 Aug 15 22:02 temp_dir

    student@CsnKhai:~$ chmod +t temp_dir
    
    student@CsnKhai:~$ ls -la | grep temp_dir
    drwxrwxr-t 2 student  student 4096 Aug 15 22:02 temp_dir
    ```

17. **What file attributes should be present in the command script?**

    File attributes that should be present in a command script include the interpreter (shebang, like `#!/bin/bash`) line to specify the shell or interpreter to use for running the script, permissions to allow execution, and potentially ownership settings.