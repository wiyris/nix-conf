function wtf # wav to flac
    set ORIGINAL_SIZE (du -hs | cut -f1)

    fd -e wav -x ffmpeg -i "file:{}" -loglevel quiet -stats "file:{.}.flac"
    fd -e wav -X trash

    set NEW_SIZE (du -hs | cut -f1)

    echo "Done. Reduced file size from $ORIGINAL_SIZE to $NEW_SIZE"
end
