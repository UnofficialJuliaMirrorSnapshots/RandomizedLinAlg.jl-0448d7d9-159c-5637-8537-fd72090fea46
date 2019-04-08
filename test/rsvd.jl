using RandomizedLinAlg
using Test, LinearAlgebra, Random

@testset "rsvd" begin

    Random.seed!(1234321)

    @testset "Small wide rectangular" begin
        A = [1. 2 3 4; 5 6 7 8]
        S1 = svd(A)
        S2 = rsvd(A, 2, 0)

        @test norm(abs.(S1.U) - abs.(S2.U)) ≤ √(eps())
        @test norm(abs.(S1.Vt) - abs.(S2.Vt)) ≤ √(eps())
        @test norm(S1.S - S2.S) ≤ √(eps())
    end

    @testset "Small tall rectangular" begin
        A = [1. 2; 3 4; 5 6; 7 8]
        S1 = svd(A)
        S2 = rsvd(A, 2, 0)
    
        @test norm(abs.(S1.U) .- abs.(S2.U)) ≤ √(eps())
        @test norm(abs.(S1.Vt) .- abs.(S2.Vt)) ≤ √(eps())
        @test norm(S1.S - S2.S) ≤ √(eps())
    end

    @testset "Small square" begin
        A = [1. 2 3; 4 5 6; 7 8 9]
        S1 = svd(A)
        S2 = rsvd(A, 3, 0)

        @test norm(abs.(S1.U) - abs.(S2.U)) ≤ √(eps())
        @test norm(abs.(S1.Vt) - abs.(S2.Vt)) ≤ √(eps())
        @test norm(S1.S - S2.S) ≤ √(eps())
    end

    @testset "Low rank" begin #Issue #42
        n = 10
        r = 2
        A = randn(n, r) * randn(r, n)
        S = svdvals(A)
        for nvals = 1 : r
            S1 = RandomizedLinAlg.rsvdvals(A, nvals, r - nvals)
            for i = 1 : nvals
                @test abs(S[i] - S1[i]) ≤ n^2 * r * eps()
            end
        end
    end

    @testset "rrange_adaptive" begin
        A = [1. 2 3; 4 5 6; 7 8 9]
        @test size(RandomizedLinAlg.rrange_adaptive(A, 3, 1e-3)) == (3,2)
    end

    @testset "rrange" begin
        A = [1. 2 3; 4 5 6; 7 8 9]
        @test_throws ArgumentError RandomizedLinAlg.rrange(A, 20)
    end
end
