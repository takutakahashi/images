#!/bin/bash
set -e

# Create user if INITIAL_USER is set
if [ -n "$INITIAL_USER" ]; then
    echo "Creating user: $INITIAL_USER"
    
    # Check if user already exists
    if ! id "$INITIAL_USER" &>/dev/null; then
        # Create group with same name as user
        groupadd "$INITIAL_USER"
        
        # Create user with home directory, bash shell, and primary group
        useradd -m -s /bin/bash -g "$INITIAL_USER" "$INITIAL_USER"
        
        echo "User $INITIAL_USER created successfully"
    else
        echo "User $INITIAL_USER already exists"
    fi
fi

# Generate SSH host keys if they don't exist
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -A
fi

# Create privilege separation directory if it doesn't exist
if [ ! -d /run/sshd ]; then
    mkdir -p /run/sshd
    chmod 755 /run/sshd
fi

# Start SSH daemon in foreground
echo "Starting SSH daemon..."
exec /usr/sbin/sshd -D
