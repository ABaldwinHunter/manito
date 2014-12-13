def parse_emails(string)
  string.gsub(/\s+/, "").split(",")
end
