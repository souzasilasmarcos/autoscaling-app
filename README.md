![image](https://user-images.githubusercontent.com/30444491/134281995-fe315445-f908-4e25-b82a-ffcca961ec89.png)

# autoscaling-app
Autoscaling-app em Iac em nova estrutura sobre cloud AWS

Toda estrutura iac baseada em terraform

Projeto Noob: AWS com Terraform automatizando infraestrutura via codigo.

Todos os artefatos e modulos Terraform publicado nas seguintes plataformas:

https://registry.terraform.io/providers/hashicorp/aws/latest/docs

Neste ambiente podemos desenvolver aplicações simples do Terraform envolvendo site estático em docker com os seguintes recursos com duas frentes, sendo a 1ª com uso de CloudFront para nosso site e a segunda com estrutura de nós em EC2 porem com aplicação rodando em container:
(AWS S3 / Route53) com certificado SSL (AWS Certificate Manager) e CDN (CloudFront), aplicação auto-escalável (EC2, VPC, Load Balancer, Auto Scaling Group, RDS e CloudWatch) e aplicação estatica.

Nosso objetivo com os estes recursos que iremos instanciar de forma simples podemos alterá-los ou destruí-los e no ASG podemos escalar de forma horizontal nossa estrutura de instancias para isso desenvolvemos variáveis, interpolação, outputs, locals, remote state, built-in functions, data sources, for_each e for, módulos, workspaces e null_resources com provisioners.

Neste ambiente simulado em cloud AWS regiao sa-east-1 iremos desenvolver via automaçao no terraform:

Automatizar a criação e manutenção da infraestrutura para aplicaçao nodejs na AWS.
Usar módulos nativos, interpolação, arquivos de estado do Terraform versao 1.0.6
Subida de um site estático com nodejs em container subida em template e userdate alem de utilizar AWS S3, Cloudfront, certificado SSL e domínio personalizado no ALB
Estruturar a aplicação auto-escalável com VPC, Internet Gateway, Subnets, Security Groups, EC2, Load Balancer e Auto Scaling Group.

Diagram do projeto: <<

![image](https://user-images.githubusercontent.com/30444491/134282100-a666ab96-ae67-4d41-bcfb-fe154cabc172.png)

