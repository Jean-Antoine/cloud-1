resource "aws_route53_zone" "main" {
  name = "jeada-si.fr"
}

resource "aws_route53_record" "cloud1" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "cloud-1.jeada-si.fr"
  type    = "A"
  ttl     = 300
  records = [aws_instance.main.public_ip]
}
