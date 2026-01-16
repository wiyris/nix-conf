function opus
    set ORIGINAL_SIZE (du -hs | cut -f1)

    fd -e wav -e flac -x ffmpeg -i "file:{}" -c:a libopus -b:a 128K -loglevel quiet -stats "file:{.}.opus"
    fd -e wav -e flac -X rm -I

    set NEW_SIZE (du -hs | cut -f1)

    echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
end
