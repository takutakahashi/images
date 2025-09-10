#!/bin/bash
set -e

# Create user if INITIAL_USER is set
if [ -n "$INITIAL_USER" ]; then
    echo "Creating user: $INITIAL_USER"
    
    # Check if user already exists
    if ! id "$INITIAL_USER" &>/dev/null; then
        # Create user with home directory and bash shell
        useradd -m -s /bin/bash "$INITIAL_USER"
        
        # Set a default password (same as username)
        echo "$INITIAL_USER:$INITIAL_USER" | chpasswd
        
        # Add user to sudo group
        usermod -aG sudo "$INITIAL_USER"
        
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