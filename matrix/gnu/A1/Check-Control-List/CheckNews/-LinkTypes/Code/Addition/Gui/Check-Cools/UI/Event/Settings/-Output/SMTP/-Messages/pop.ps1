#!/home/admin/app/PowerShell/Members

# Pop smtp messages from a remote queue and process them
while (( $(ss -lntp | grep :25 | wc -l) > 0 )){
    # Fetch the first message from the remote queue
    message=$(nc -u -w 1 localhost 2525 <<< "GET /messages/1 HTTP/1.1\r\nHost: remote_queue_host\r\n\r\n")

    # Check if the message exists
    if ($? -eq 0 ) {
        # Extract the message body from the response
        body=$(echo "$message" | grep -o -E '(?<=\r\n\r\n).*' | tr -d '\r\n')
        
        # Process the message body (e.g., send an email)
        Write-Output "Processing message: $body"

        # Send an email with the message body
        Write-Output "$body" | mail -s "New Message Received" recipient@example.com

        # Delete the processed message from the remote queue
        nc -u -w 1 localhost 2525 '<<<' "DELETE /messages/1 HTTP/1.1\r\nHost: remote_queue_host\r\n\r\n"
    }

    sleep 1
    # Wait for the next message to arrive
    continue
    # Note: Adjust the sleep interval based on the desired processing rate
    # (e.g., sleep 1 for a rate of 1 message per second)
}


# Handle the case when the remote queue is down or unreachable
if ((ss -lntp | grep :25 | wc -l == 0 )){
    Write-Output "Remote queue is unreachable. Check the queue's connection and try again later."
}


# Handle the case when the PowerShell script is terminated
trap {
    Write-Output "PowerShell script terminated. Exiting..."
    break
}


# Handle the case when the remote queue connection is lost
while (( $(nc -u -w 1 localhost 2525 '<<<' "GET /health/check HTTP/1.1\r\nHost: remote_queue_host\r\n\r\n") | grep -q 'OK' )) {
    Write-Output "Remote queue connection is lost. Waiting for reconnection..."
    sleep 5
    continue
}


Write-Output "Remote queue connection reestablished. Continuing processing..."

