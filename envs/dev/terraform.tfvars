environment = "dev"

vpc_cidr = "10.0.0.0/16"

public_subnets_cidrs = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets_cidrs = [
  "10.0.101.0/24",
  "10.0.102.0/24"
]

availability_zones = ["eu-north-1a", "eu-north-1b"]

sg_name = "web-sg"

sg_ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

sg_egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

tags = {
  Environment = "dev"
  Project     = "MyApp"
}

ami_id = "ami-034292739b6480a6b"

instances = [
  { instance_type = "t3.micro" },
  { instance_type = "t3.micro" }
]

launch_in = "public"

iam_policy_arns = [
  "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
  "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
]
