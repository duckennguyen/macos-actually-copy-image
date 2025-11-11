local function sanitizeClipboard() 
    local img = hs.pasteboard.readImage() 
    local txt = hs.pasteboard.readString()
    local url = hs.pasteboard.readURL()
    local app = hs.application.frontmostApplication()
    local log = hs.logger.new('sanitizer','debug')
    if string.sub(app:bundleID(), 1, #"com.microsoft") ~= "com.microsoft" then
        if img ~= nil then 
            clipboardWatcher:stop() 
            hs.pasteboard.clearContents() 
            hs.pasteboard.writeObjects(img) 
            clipboardWatcher:start()
            log.i('Stripping URL from copied image')
        end
    else
        if img ~= nil and url~=nil then 
            clipboardWatcher:stop() 
            hs.pasteboard.clearContents() 
            hs.pasteboard.writeObjects(img) 
            clipboardWatcher:start()
            log.i('Word: Stripping URL from copied image')
        elseif txt ~= nil then
            clipboardWatcher:stop() 
            hs.pasteboard.clearContents() 
            hs.pasteboard.writeObjects(txt) 
            clipboardWatcher:start()
            log.i('Word: Stripping image from copied text')
        end
    end
end

clipboardWatcher = hs.pasteboard.watcher.new(sanitizeClipboard) 
clipboardWatcher:start()
