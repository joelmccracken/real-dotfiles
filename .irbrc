# -*- mode: ruby -*-

def rename_things_in_file(file_name, renames)
  text = File.read(file_name)
  renames.each do |k,v|
    text.gsub!(k, v)
  end

  # # To merely print the contents of the file, use:
  # puts new_contents

  # To write changes to the file, use:
  File.open(file_name, "w") {|file| file.puts text }
end

CONSTS ||= {}

CONSTS[:fur_renames] = {
  "file_upload_request" => "provisioning_upload",
  "fileUploadRequest" => "provisioningUpload",
  "FileUploadRequest" => "ProvisioningUpload",
}

def exp(x)
  Dir[File.expand_path x]
end

def reload!
  load exp("~/.irbrc")
end

require 'fileutils'

def cd(dir, &block)
  FileUtils.cd(exp(dir), {verbose: true}, &block)
end

def ls()
  Dir["*"]
end
