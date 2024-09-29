provider "aws" {
    region     = var.aws_region
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
    token      = var.aws_session_token
  }
  
resource "aws_api_gateway_rest_api" "tech_challenge_api" {
    name        =   "Tech-Challenge-API"
    description =   "API Gateway para projeto do Tech Challenge na Pos da FIAP"
    body        =   file("api_contract.yaml")
}

resource "aws_api_gateway_deployment" "tech_challenge_api_deployment" {
    rest_api_id = aws_api_gateway_rest_api.tech_challenge_api.id
    stage_name  = var.stage

    depends_on = [
      aws_api_gateway_rest_api.tech_challenge_api
    ]
}
  
  
  variable "aws_access_key" {}
  variable "aws_secret_key" {}
  variable "aws_session_token" {}
  variable "aws_region" {}
  variable "stage" { default = "prod" }