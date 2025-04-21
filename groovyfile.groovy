#!/bin/bash
#declarative pipeline
pipeline {
    agent any/none {
        parameters {
            String (name:'', defaultvalue:'', description:'')
        }

        tools {
            maven 'apache-maven-3.0.1'
        }

        environment {
        MY_VARIABLE = 'Some Value'
        }
        
        options {
            retry(3) // try to run 3 times on failure
        }
        stages{
            stage('Build') {
                agent {
                    label 'windows'
                }
                when {
            expression {
                currentBuild.result == 'FAILURE' || 
            }
            when {
                branch 'master' //1
                branch pattern: "release-\\dt", comparator: "REGEXP"
                environment name: 'DEPLOY_TO', value: 'production'
                triggered By cause: "User Id cause", details: "Name"
            }
        } 
                steps{
                    git([url:'',branch:''])
                }
            stage('Compile') {
                steps {
                sh 'echo hello word is same as below'
                sh([script:'echo hello word'])
                }
            }
            stage('Deploy') {
                   parallel {
                stage('Unit Tests') {
                    steps {
                        echo 'Running unit tests...'
                    }
                }
                stage('Integration Tests') {
                    steps {
                        echo 'Running integration tests...'
                    }
                }
            }
            }
        }
    }
}

#Scripted pipeline

node(''){
    //
    stage('Checkout') {
        try {
            sh 'npm install python'
        }
        catch (Exception e) {
            currentBuild.result = 'Failure'
            throw e
        }
    }
    stage('Install dependencies') {
    }
    stage('Test') {
        sh 'npm test'
    }
    stage('Build') {

    }
    stage('Artifactory') {

    }
    stage('Sonarqube report'){

    }
    stage('Deploy'){
        

    }

    post {
        success {
            echo
        }
        failure {
            mail to: team@example.Compile
            subject: The pipeline failed
        }
        always {
            junit '**/target/**.xml'
        }
        unstable {

        }
        changed{

        }
    }
}