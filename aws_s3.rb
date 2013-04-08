class ToastS3

  attr_reader :s3, :bucket

  def initialize
    @bucket_name = ENV['S3_BUCKET']
    @s3 = AWS::S3.new(access_key_id: ENV['S3_KEY'], secret_access_key: ENV['S3_SECRET'])
    @bucket = @s3.buckets[@bucket_name]
  end

  def bucket_names
    @s3.buckets.map { |bucket| bucket.name }
  end

  def create_bucket
    @s3.buckets.create @bucket_name
  end

  def set_bucket_acl
    @bucket.acl = :public_read
  end

  def object(key)
    @bucket.objects[key]
  end

  def object_keys
    @bucket.objects.map { |obj| obj.key }
  end

  def delete_all!
    @bucket.objects.each do |obj|
      puts obj.key
      obj.delete
    end
  end

  def write(key, path)
    obj = object(key)
    obj.write(Pathname.new(path), :acl => :public_read)
  end

  def store(path, file)
    AWS::S3::S3Object.store(path, file, @bucket, :access => :public_read)
  end
end
